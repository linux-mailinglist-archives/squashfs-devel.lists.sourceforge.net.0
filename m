Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA452E33E
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZi-0007Hh-Th; Fri, 20 May 2022 03:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqW14-0004Vt-97
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 08:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57om41bkvhtg16J7Zq33UVF20S8iXroX3xoYP7PR9EA=; b=WiVC/VAmM3LrkB9MYoQk74uCgV
 vP8SfBfD1c7XRp+amzdbdw/IgNDVSBvXtE5abfjn6L8ge/c5fmpiHHSeLc1Eamx1Qdm1sa5VwRcv4
 LRGXJ+iZYp/QeJBycwoDeDekFUnWih5VTCfdAw6ho8YMgw0z19cL6GM2qfavu2x5p3ms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=57om41bkvhtg16J7Zq33UVF20S8iXroX3xoYP7PR9EA=; b=HaziBefqM4ZzJC7xTrvjYUTRqJ
 Ie5fji+JDP8eeE7nYycXWdTCPlvj5RpuW4yzYk/qqe3eJPjdYvcBAeJlXN5Bu9Gwo+cmQGkif3ML2
 FwSlaOHheLH6C3eyo30tqcByMctxTQywQkk0K42nj9bjF1oDUyPjkursIZRHJuGJdQNQ=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqW12-0007r8-TQ
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 08:23:46 +0000
Received: by mail-vs1-f45.google.com with SMTP id d22so14705366vsf.2
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57om41bkvhtg16J7Zq33UVF20S8iXroX3xoYP7PR9EA=;
 b=eh1+3XH9K3ISf1tP7tRoAEPD9NY8O26jLbB/+HG5fBE6r19UXWhjXlnmya3Dq0+C0K
 rztC3uKVYbVpO1Wl8wjCLYdoRHAFjkN8gaN/BHDbeCcpSUs0JepC2Cndn993QzzGphOC
 OKE6RSIuvfxkHGA4vTkDujFIuEXqQCSDQXBNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57om41bkvhtg16J7Zq33UVF20S8iXroX3xoYP7PR9EA=;
 b=zMqJCyT8Y1+CeoO35Ln2CNXYJB3h1WuYFbJVuFCYqicjxrDcw0Igc9nWrV+UAGWNeu
 /F62oqe6EgCjHFbo2Pufox3Vo567XMn5N7oLZ6arc2L5vPoce1H6Fta56gxiUB2/taFj
 doZMGPRGNxFZMvo8AW3kv1MEh01YPt2cVj7v+in8MgVZ921DFhpTtMgDUIFYa8Gggl2t
 cmI6mRJ+EGyF5tZBw91L2JzckhVHOghWd8lf8lo41AFcFefZw6EdbxFQU2L41BZklLI4
 BHuC6XIRODwgdvIS/9gOx2diyMoknvqcDo2BDGOXehQF9hfRwFKBInDXQzfS/GGjuLqx
 x/BQ==
X-Gm-Message-State: AOAM532Fae72ss3Qj0b3srqU4rFV3t5eSQHHl/4E7ZeaUO+pAPZIKBL5
 6DuRizrg/+0rTJHiGvpYiS/Cq7ZdKqaoIs8XEheoJHqyAnQ=
X-Google-Smtp-Source: ABdhPJx8PQPyUiKbr1NM4sAPHW0QDn5d5QEPVgvAicN3LyrwSJEEZXHLFtugJX85WqE/YwxubqN2QvkQF5GH7zQEfvM=
X-Received: by 2002:a67:d999:0:b0:335:7e5c:63d5 with SMTP id
 u25-20020a67d999000000b003357e5c63d5mr4668644vsj.69.1652689418975; Mon, 16
 May 2022 01:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
 <1f8a8009-1c05-d55c-08bd-89c5916e5240@squashfs.org.uk>
 <CAJMQK-gHZ_SEykcB7Ux6ccJ68NK=MrXpP=yXv6CLFc9knriAeQ@mail.gmail.com>
 <d67b3646-9717-760c-1fc6-77c8a376ba38@squashfs.org.uk>
In-Reply-To: <d67b3646-9717-760c-1fc6-77c8a376ba38@squashfs.org.uk>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 May 2022 16:23:12 +0800
Message-ID: <CAJMQK-g9tA4Ev_fkFTvW=CbpZRTgBLE4ynfGNUAi7pOPfpeTXg@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Content-Type: multipart/mixed; boundary="000000000000be5b9505df1cbd3e"
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, May 15,
 2022 at 8:55 AM Phillip Lougher <phillip@squashfs.org.uk>
 wrote: > > On 13/05/2022 07:35, Hsin-Yi Wang wrote: > > On Fri, May 13, 2022
 at 1:33 PM Phillip Lougher <phillip@squashfs.org. [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqW12-0007r8-TQ
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

--000000000000be5b9505df1cbd3e
Content-Type: text/plain; charset="UTF-8"

On Sun, May 15, 2022 at 8:55 AM Phillip Lougher <phillip@squashfs.org.uk> wrote:
>
> On 13/05/2022 07:35, Hsin-Yi Wang wrote:
> > On Fri, May 13, 2022 at 1:33 PM Phillip Lougher <phillip@squashfs.org.uk> wrote:
> >>
> >> My understanding is that this call will fully populate the
> >> pages array with page references without any holes.  That
> >> is none of the pages array entries will be NULL, meaning
> >> there isn't a page for that entry.  In other words, if the
> >> pages array has 32 pages, each of the 32 entries will
> >> reference a page.
> >>
> > I noticed that if nr_pages < max_pages, calling read_blocklist() will
> > have SQUASHFS errors,
> >
> > SQUASHFS error: Failed to read block 0x125ef7d: -5
> > SQUASHFS error: zlib decompression failed, data probably corrupt
> >
> > so I did a check if nr_pages < max_pages before squashfs_read_data(),
> > just skip the remaining pages and let them be handled by readpage.
> >
>
> Yes that avoids passing the decompressor code a too small page range.
> As such extending the decompressor code isn't necessary.
>
> Testing your patch I discovered a number of cases where
> the decompressor still failed as above.
>
> This I traced to "sparse blocks", these are zero filled blocks, and
> are indicated/stored as a block length of 0 (bsize == 0).  Skipping
> this sparse block and letting it be handled by readpage fixes this
> issue.
>
Ack. Thanks for testing this.

> I also noticed a potential performance improvement.  You check for
> "pages[nr_pages - 1]->index >> shift) == index" after calling
> squashfs_read_data.  But this information is known before
> calling squashfs_read_data and moving the check to before
> squashfs_read_data saves the cost of doing a redundant block
> decompression.
>
After applying this, The performance becomes:
2.73s
2.76s
2.73s

Original:
2.76s
2.79s
2.77s

(The pack file is different from my previous testing in this email thread.)

> Finally I noticed that if nr_pages grows after the __readahead_batch
> call, then the pages array and the page actor will be too small, and
> it will cause the decompressor to fail.  Changing the allocation to
> max_pages fixes this.
>
Ack.

I've added the fixes patch and previous fixes.
> I have rolled these fixes into the patch below (also attached in
> case it gets garbled).
>
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index 7cd57e0d88de..14485a7af5cf 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -518,13 +518,11 @@ static void squashfs_readahead(struct
> readahead_control *ractl)
>             file_end == 0)
>                 return;
>
> -       nr_pages = min(readahead_count(ractl), max_pages);
> -
> -       pages = kmalloc_array(nr_pages, sizeof(void *), GFP_KERNEL);
> +       pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
>         if (!pages)
>                 return;
>
> -       actor = squashfs_page_actor_init_special(pages, nr_pages, 0);
> +       actor = squashfs_page_actor_init_special(pages, max_pages, 0);
>         if (!actor)
>                 goto out;
>
> @@ -538,11 +536,18 @@ static void squashfs_readahead(struct
> readahead_control *ractl)
>                         goto skip_pages;
>
>                 index = pages[0]->index >> shift;
> +
> +               if ((pages[nr_pages - 1]->index >> shift) != index)
> +                       goto skip_pages;
> +
>                 bsize = read_blocklist(inode, index, &block);
> +               if (bsize == 0)
> +                       goto skip_pages;
> +
>                 res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
>                                          actor);
>
> -               if (res >= 0 && (pages[nr_pages - 1]->index >> shift) == index)
> +               if (res >= 0)
>                         for (i = 0; i < nr_pages; i++)
>                                 SetPageUptodate(pages[i]);
>
> --
> 2.34.1
>
>
>
> Phillip
>
>
> >> This is important for the decompression code, because it
> >> expects each pages array entry to reference a page, which
> >> can be kmapped to an address.  If an entry in the pages
> >> array is NULL, this will break.
> >>
> >> If the pages array can have holes (NULL pointers), I have
> >> written an update patch which allows the decompression code
> >> to handle these NULL pointers.
> >>
> >> If the pages array can have NULL pointers, I can send you
> >> the patch which will deal with this.
> >
> > Sure, if there are better ways to deal with this.
> >
> > Thanks.
> >
> >>
> >> Thanks
> >>
> >> Phillip
> >>
> >>
> >>
> >>>
> >>>>>
> >>>>> It's also noticed that when the crash happened, nr_pages obtained by
> >>>>> readahead_count() is 512.
> >>>>> nr_pages = readahead_count(ractl); // this line
> >>>>>
> >>>>> 2) Normal cases that won't crash:
> >>>>> [   22.651750] Block @ 0xb3bbca6, compressed size 42172, src size 262144
> >>>>> [   22.653580] Block @ 0xb3c6162, compressed size 29815, src size 262144
> >>>>> [   22.656692] Block @ 0xb4a293f, compressed size 17484, src size 131072
> >>>>> [   22.666099] Block @ 0xb593881, compressed size 39742, src size 262144
> >>>>> [   22.668699] Block @ 0xb59d3bf, compressed size 37841, src size 262144
> >>>>> [   22.695739] Block @ 0x13698673, compressed size 65907, src size 131072
> >>>>> [   22.698619] Block @ 0x136a87e6, compressed size 3155, src size 131072
> >>>>> [   22.703400] Block @ 0xb1babe8, compressed size 99391, src size 131072
> >>>>> [   22.706288] Block @ 0x1514abc6, compressed size 4627, src size 131072
> >>>>>
> >>>>> nr_pages are observed to be 32, 64, 256... These won't cause a crash.
> >>>>> Other values (max_pages, bsize, block...) looks normal
> >>>>>
> >>>>> I'm not sure why the crash happened, but I tried to modify the mask
> >>>>> for a bit. After modifying the mask value to below, the crash is gone
> >>>>> (nr_pages are <=256).
> >>>>> Based on my testing on a 300K pack file, there's no performance change.
> >>>>>
> >>>>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> >>>>> index 20ec48cf97c5..f6d9b6f88ed9 100644
> >>>>> --- a/fs/squashfs/file.c
> >>>>> +++ b/fs/squashfs/file.c
> >>>>> @@ -499,8 +499,8 @@ static void squashfs_readahead(struct
> >>>>> readahead_control *ractl)
> >>>>>     {
> >>>>>            struct inode *inode = ractl->mapping->host;
> >>>>>            struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> >>>>> -       size_t mask = (1UL << msblk->block_log) - 1;
> >>>>>            size_t shift = msblk->block_log - PAGE_SHIFT;
> >>>>> +       size_t mask = (1UL << shift) - 1;
> >>>>>
> >>>>>
> >>>>> Any pointers are appreciated. Thanks!
> >>>>
> >>

--000000000000be5b9505df1cbd3e
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-WIP-squashfs-implement-readahead.patch"
Content-Disposition: attachment; 
	filename="0001-WIP-squashfs-implement-readahead.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l38gla540>
X-Attachment-Id: f_l38gla540

RnJvbSBiMjRlN2U2MDY4ZjNlNTZhNjZiOTE0Nzk4YmJjNGRkODRhODRiMWNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+CkRh
dGU6IFN1biwgMTAgT2N0IDIwMjEgMjE6MjI6MjUgKzA4MDAKU3ViamVjdDogW1BBVENIXSBzcXVh
c2hmczogaW1wbGVtZW50IHJlYWRhaGVhZAoKSW1wbGVtZW50IHJlYWRhaGVhZCBjYWxsYmFjayBm
b3Igc3F1YXNoZnMuIEl0IHdpbGwgcmVhZCBkYXRhYmxvY2tzCndoaWNoIGNvdmVyIHBhZ2VzIGlu
IHJlYWRhaGVhZCByZXF1ZXN0LiBGb3IgYSBmZXcgY2FzZXMgaXQgd2lsbApub3QgbWFyayBwYWdl
IGFzIHVwdG9kYXRlLCBpbmNsdWRpbmc6Ci0gZmlsZSBlbmQgaXMgMC4KLSB6ZXJvIGZpbGxlZCBi
bG9ja3MuCi0gY3VycmVudCBiYXRjaCBvZiBwYWdlcyBpc24ndCBpbiB0aGUgc2FtZSBkYXRhYmxv
Y2sgb3Igbm90IGVub3VnaCBpbiBhCiAgZGF0YWJsb2NrLgpPdGhlcndpc2UgcGFnZXMgd2lsbCBi
ZSBtYXJrZWQgYXMgdXB0b2RhdGUuIFRoZSB1bmhhbmRsZWQgcGFnZXMgd2lsbCBiZQp1cGRhdGVk
IGJ5IHJlYWRwYWdlIGxhdGVyLgoKU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlA
Y2hyb21pdW0ub3JnPgotLS0KIGZzL3NxdWFzaGZzL2ZpbGUuYyB8IDc5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvc3F1YXNoZnMvZmlsZS5j
IGIvZnMvc3F1YXNoZnMvZmlsZS5jCmluZGV4IDg5ZDQ5MjkxNmRlYS4uNDhiMTM0YTMxNWI3IDEw
MDY0NAotLS0gYS9mcy9zcXVhc2hmcy9maWxlLmMKKysrIGIvZnMvc3F1YXNoZnMvZmlsZS5jCkBA
IC0zOSw2ICszOSw3IEBACiAjaW5jbHVkZSAic3F1YXNoZnNfZnNfc2IuaCIKICNpbmNsdWRlICJz
cXVhc2hmc19mc19pLmgiCiAjaW5jbHVkZSAic3F1YXNoZnMuaCIKKyNpbmNsdWRlICJwYWdlX2Fj
dG9yLmgiCiAKIC8qCiAgKiBMb2NhdGUgY2FjaGUgc2xvdCBpbiByYW5nZSBbb2Zmc2V0LCBpbmRl
eF0gZm9yIHNwZWNpZmllZCBpbm9kZS4gIElmCkBAIC00OTQsNyArNDk1LDgzIEBAIHN0YXRpYyBp
bnQgc3F1YXNoZnNfcmVhZHBhZ2Uoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBwYWdlICpwYWdl
KQogCXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBzcXVhc2hmc19yZWFkYWhlYWQoc3RydWN0
IHJlYWRhaGVhZF9jb250cm9sICpyYWN0bCkKK3sKKwlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gcmFj
dGwtPm1hcHBpbmctPmhvc3Q7CisJc3RydWN0IHNxdWFzaGZzX3NiX2luZm8gKm1zYmxrID0gaW5v
ZGUtPmlfc2ItPnNfZnNfaW5mbzsKKwlzaXplX3QgbWFzayA9ICgxVUwgPDwgbXNibGstPmJsb2Nr
X2xvZykgLSAxOworCXNpemVfdCBzaGlmdCA9IG1zYmxrLT5ibG9ja19sb2cgLSBQQUdFX1NISUZU
OworCWxvZmZfdCByZXFfZW5kID0gcmVhZGFoZWFkX3BvcyhyYWN0bCkgKyByZWFkYWhlYWRfbGVu
Z3RoKHJhY3RsKTsKKwlsb2ZmX3Qgc3RhcnQgPSByZWFkYWhlYWRfcG9zKHJhY3RsKSAmfiBtYXNr
OworCXNpemVfdCBsZW4gPSByZWFkYWhlYWRfbGVuZ3RoKHJhY3RsKSArIHJlYWRhaGVhZF9wb3Mo
cmFjdGwpIC0gc3RhcnQ7CisJc3RydWN0IHNxdWFzaGZzX3BhZ2VfYWN0b3IgKmFjdG9yOworCXVu
c2lnbmVkIGludCBucl9wYWdlcyA9IDA7CisJc3RydWN0IHBhZ2UgKipwYWdlczsKKwl1NjQgYmxv
Y2sgPSAwOworCWludCBic2l6ZSwgcmVzLCBpLCBpbmRleDsKKwlpbnQgZmlsZV9lbmQgPSBpX3Np
emVfcmVhZChpbm9kZSkgPj4gbXNibGstPmJsb2NrX2xvZzsKKwl1bnNpZ25lZCBpbnQgbWF4X3Bh
Z2VzID0gMVVMIDw8IHNoaWZ0OworCisJcmVhZGFoZWFkX2V4cGFuZChyYWN0bCwgc3RhcnQsIChs
ZW4gfCBtYXNrKSArIDEpOworCisJaWYgKHJlYWRhaGVhZF9wb3MocmFjdGwpICsgcmVhZGFoZWFk
X2xlbmd0aChyYWN0bCkgPCByZXFfZW5kIHx8CisJICAgIGZpbGVfZW5kID09IDApCisJCXJldHVy
bjsKKworCXBhZ2VzID0ga21hbGxvY19hcnJheShtYXhfcGFnZXMsIHNpemVvZih2b2lkICopLCBH
RlBfS0VSTkVMKTsKKwlpZiAoIXBhZ2VzKQorCQlyZXR1cm47CisKKwlhY3RvciA9IHNxdWFzaGZz
X3BhZ2VfYWN0b3JfaW5pdF9zcGVjaWFsKHBhZ2VzLCBtYXhfcGFnZXMsIDApOworCWlmICghYWN0
b3IpCisJCWdvdG8gb3V0OworCisJZm9yICg7OykgeworCQlucl9wYWdlcyA9IF9fcmVhZGFoZWFk
X2JhdGNoKHJhY3RsLCBwYWdlcywgbWF4X3BhZ2VzKTsKKwkJaWYgKCFucl9wYWdlcykKKwkJCWJy
ZWFrOworCisJCWlmIChyZWFkYWhlYWRfcG9zKHJhY3RsKSA+PSBpX3NpemVfcmVhZChpbm9kZSkg
fHwKKwkJICAgIG5yX3BhZ2VzIDwgbWF4X3BhZ2VzKQorCQkJZ290byBza2lwX3BhZ2VzOworCisJ
CWluZGV4ID0gcGFnZXNbMF0tPmluZGV4ID4+IHNoaWZ0OworCQlpZiAoKHBhZ2VzW25yX3BhZ2Vz
IC0gMV0tPmluZGV4ID4+IHNoaWZ0KSAhPSBpbmRleCkKKwkJCWdvdG8gc2tpcF9wYWdlczsKKwor
CQlic2l6ZSA9IHJlYWRfYmxvY2tsaXN0KGlub2RlLCBpbmRleCwgJmJsb2NrKTsKKwkJaWYgKGJz
aXplID09IDApCisJCQlnb3RvIHNraXBfcGFnZXM7CisKKwkJcmVzID0gc3F1YXNoZnNfcmVhZF9k
YXRhKGlub2RlLT5pX3NiLCBibG9jaywgYnNpemUsIE5VTEwsCisJCQkJCSBhY3Rvcik7CisKKwkJ
aWYgKHJlcyA+PSAwKQorCQkJZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspCisJCQkJU2V0
UGFnZVVwdG9kYXRlKHBhZ2VzW2ldKTsKKworCQlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkr
KykgeworCQkJdW5sb2NrX3BhZ2UocGFnZXNbaV0pOworCQkJcHV0X3BhZ2UocGFnZXNbaV0pOwor
CQl9CisJfQorCisJa2ZyZWUoYWN0b3IpOworCWtmcmVlKHBhZ2VzKTsKKwlyZXR1cm47CisKK3Nr
aXBfcGFnZXM6CisJZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspIHsKKwkJdW5sb2NrX3Bh
Z2UocGFnZXNbaV0pOworCQlwdXRfcGFnZShwYWdlc1tpXSk7CisJfQorCisJa2ZyZWUoYWN0b3Ip
Oworb3V0OgorCWtmcmVlKHBhZ2VzKTsKK30KIAogY29uc3Qgc3RydWN0IGFkZHJlc3Nfc3BhY2Vf
b3BlcmF0aW9ucyBzcXVhc2hmc19hb3BzID0gewotCS5yZWFkcGFnZSA9IHNxdWFzaGZzX3JlYWRw
YWdlCisJLnJlYWRwYWdlID0gc3F1YXNoZnNfcmVhZHBhZ2UsCisJLnJlYWRhaGVhZCA9IHNxdWFz
aGZzX3JlYWRhaGVhZAogfTsKLS0gCjIuMzEuMAoK
--000000000000be5b9505df1cbd3e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--000000000000be5b9505df1cbd3e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel

--000000000000be5b9505df1cbd3e--

