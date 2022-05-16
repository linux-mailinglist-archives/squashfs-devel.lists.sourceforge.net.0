Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368652E337
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007Hn-0H; Fri, 20 May 2022 03:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqWkV-0000ef-L7
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 09:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ii5FY2jXFex4hGh1G+unN71+Qi8kEl20iQHBsa7zKuI=; b=R0Xdy4a5m2VzzDv0GM7KgiVCJR
 roPnLrH8NU7lfIO4jNkMhZQp0kZ1aphyG9bM/Aj1NPIWbn7mQcKz1b/yeBCo1ouwUTgVRAgysHpCo
 vJ1qQh6jA3s9ivsU441/0DfMEAll/ZRsoE7a7Gi/Asxgz/GfMlW+W8yqyqF/uZ929oAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ii5FY2jXFex4hGh1G+unN71+Qi8kEl20iQHBsa7zKuI=; b=IcnfWMKE3DfU6kcrgCqKsRDSUb
 B1Bymu6ZfViRmhfcnL6HvRr3DZs0dy1V3uandQ3vA8lDD79N9nVNN4mTFTZURxuVfXEElv0feY4As
 I2UJXfNP0+UDviEe+suxdEZqX5Y/OVtEu/JAb4ZBQQndYiiulOppjaWnyrawv0npQRcc=;
Received: from mail-vk1-f174.google.com ([209.85.221.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqWkS-00GjoD-V8
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 09:10:42 +0000
Received: by mail-vk1-f174.google.com with SMTP id m203so7150539vke.13
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ii5FY2jXFex4hGh1G+unN71+Qi8kEl20iQHBsa7zKuI=;
 b=HKyMlK0yFmfdq4wkT6pM/Ynozaiiw7CeIjCf3UnDLDBIRCr4srWTtqPp2Tka7HSJOM
 wMbUHA0Rqn6PHq8KuJ7yWYzGXl17+ZmmBrVtoff7qkD9FxU7A10hk3RVHUrwqODeP1Dz
 vnI+rolMGXVlFIeQoGZu0qaKk1LMJEMVGSmfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ii5FY2jXFex4hGh1G+unN71+Qi8kEl20iQHBsa7zKuI=;
 b=GlrF1LBP0p2cdv2Y/DJ+Xx75mjIDdEZswzg11EQ8ikuLEoxtXHws7OKUmWZGqv1keV
 sAo1vVJWo9NV+j5dVoe7NDu3ePiJZ3SyG329PfcYD0MXBZWp2OIjc52T7yqkmL5ZTRqO
 Dhvg6H8jiDGqgC1Dr7uyuj7s92AjbB4PEIy5n4qr3BFtwizcxCgNaz//yLbHHllpfYB5
 yFSniCOTrLC/NV3BoliYXOU7F14rHX4oLXE0ICV8Lrk3SlK2cIaQe/ZOomRSxqzdVHIe
 XdH4ATwkdwqDxFiuQb+ryteOyyjw0FhWmLrJHv8g/Pc+AA02fYLOtq8p+2uksB2kLrWN
 y7uQ==
X-Gm-Message-State: AOAM5303+3Cs0rbJsqOKS7toqtAMwU2CGE+Cgq3VK25eGJKFkqjiFOXP
 OG4f/yRTmC1PrldLPFL+ROEnuUK2a7plEKDPAfrYHQ==
X-Google-Smtp-Source: ABdhPJyEwfrJ/7h1rxSK7/W2GHA0YUBkW9U1+rlwCipIDwW1N4tDFoVdhz8TuVlDCctYW0bkLkWjb52Mdhhucx5GLDU=
X-Received: by 2002:ac5:c856:0:b0:34e:d0b4:7a10 with SMTP id
 g22-20020ac5c856000000b0034ed0b47a10mr6009533vkm.39.1652692234966; Mon, 16
 May 2022 02:10:34 -0700 (PDT)
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
 <CAJMQK-g9tA4Ev_fkFTvW=CbpZRTgBLE4ynfGNUAi7pOPfpeTXg@mail.gmail.com>
 <CAEVVKH8tQeBH-hPyq69ncJPXKw=o_q0e0f+K9n8psXX7jXq_vA@mail.gmail.com>
In-Reply-To: <CAEVVKH8tQeBH-hPyq69ncJPXKw=o_q0e0f+K9n8psXX7jXq_vA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 May 2022 17:10:09 +0800
Message-ID: <CAJMQK-g+6j=Ty98PExxcaawU-tYP6aiA1PQ1oSmr_KSnYLfxZQ@mail.gmail.com>
To: Xiongwei Song <sxwjean@gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 16,
 2022 at 5:00 PM Xiongwei Song <sxwjean@gmail.com>
 wrote: > > You can not just sign your signature. You ignored others'
 contributions.
 > This is unacceptable. > Hi, Don't be angry. My thought is, since this is
 still under review and I'm not sure if the performance issue is settled,
 it's more important to make sure it's ready. 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.174 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.174 listed in wl.mailspike.net]
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
X-Headers-End: 1nqWkS-00GjoD-V8
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
 Zhang Yi <yi.zhang@huawei.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Hou Tao <houtao1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Mon, May 16, 2022 at 5:00 PM Xiongwei Song <sxwjean@gmail.com> wrote:
>
> You can not just sign your signature. You ignored others' contributions.
> This is unacceptable.
>

Hi,

Don't be angry. My thought is, since this is still under review and
I'm not sure if the performance issue is settled, it's more important
to make sure it's ready.

If it's ready, I'll send it to the list formally, so it's easier for
maintainers (Matthew) to pick. At that time, I'll add your Tested-by
(again, I'm not sure the performance now is okay for you or not, so I
didn't add your tag. It would be incorrect to add your tag if the
performance is still not desired) and Phillips's Reviewed-by (Or
Signed-off-by) (I'm also not sure if Phillip or Matthew have other
comments, so I can't add their signature now). Maintainers will
probably add their Signed-off-by when they pick the patch.

I'm sorry that if not adding the tags in this WIP patch now offended you.



> On Mon, May 16, 2022 at 4:23 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Sun, May 15, 2022 at 8:55 AM Phillip Lougher <phillip@squashfs.org.uk> wrote:
> > >
> > > On 13/05/2022 07:35, Hsin-Yi Wang wrote:
> > > > On Fri, May 13, 2022 at 1:33 PM Phillip Lougher <phillip@squashfs.org.uk> wrote:
> > > >>
> > > >> My understanding is that this call will fully populate the
> > > >> pages array with page references without any holes.  That
> > > >> is none of the pages array entries will be NULL, meaning
> > > >> there isn't a page for that entry.  In other words, if the
> > > >> pages array has 32 pages, each of the 32 entries will
> > > >> reference a page.
> > > >>
> > > > I noticed that if nr_pages < max_pages, calling read_blocklist() will
> > > > have SQUASHFS errors,
> > > >
> > > > SQUASHFS error: Failed to read block 0x125ef7d: -5
> > > > SQUASHFS error: zlib decompression failed, data probably corrupt
> > > >
> > > > so I did a check if nr_pages < max_pages before squashfs_read_data(),
> > > > just skip the remaining pages and let them be handled by readpage.
> > > >
> > >
> > > Yes that avoids passing the decompressor code a too small page range.
> > > As such extending the decompressor code isn't necessary.
> > >
> > > Testing your patch I discovered a number of cases where
> > > the decompressor still failed as above.
> > >
> > > This I traced to "sparse blocks", these are zero filled blocks, and
> > > are indicated/stored as a block length of 0 (bsize == 0).  Skipping
> > > this sparse block and letting it be handled by readpage fixes this
> > > issue.
> > >
> > Ack. Thanks for testing this.
> >
> > > I also noticed a potential performance improvement.  You check for
> > > "pages[nr_pages - 1]->index >> shift) == index" after calling
> > > squashfs_read_data.  But this information is known before
> > > calling squashfs_read_data and moving the check to before
> > > squashfs_read_data saves the cost of doing a redundant block
> > > decompression.
> > >
> > After applying this, The performance becomes:
> > 2.73s
> > 2.76s
> > 2.73s
> >
> > Original:
> > 2.76s
> > 2.79s
> > 2.77s
> >
> > (The pack file is different from my previous testing in this email thread.)
> >
> > > Finally I noticed that if nr_pages grows after the __readahead_batch
> > > call, then the pages array and the page actor will be too small, and
> > > it will cause the decompressor to fail.  Changing the allocation to
> > > max_pages fixes this.
> > >
> > Ack.
> >
> > I've added the fixes patch and previous fixes.
> > > I have rolled these fixes into the patch below (also attached in
> > > case it gets garbled).
> > >
> > > diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> > > index 7cd57e0d88de..14485a7af5cf 100644
> > > --- a/fs/squashfs/file.c
> > > +++ b/fs/squashfs/file.c
> > > @@ -518,13 +518,11 @@ static void squashfs_readahead(struct
> > > readahead_control *ractl)
> > >             file_end == 0)
> > >                 return;
> > >
> > > -       nr_pages = min(readahead_count(ractl), max_pages);
> > > -
> > > -       pages = kmalloc_array(nr_pages, sizeof(void *), GFP_KERNEL);
> > > +       pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
> > >         if (!pages)
> > >                 return;
> > >
> > > -       actor = squashfs_page_actor_init_special(pages, nr_pages, 0);
> > > +       actor = squashfs_page_actor_init_special(pages, max_pages, 0);
> > >         if (!actor)
> > >                 goto out;
> > >
> > > @@ -538,11 +536,18 @@ static void squashfs_readahead(struct
> > > readahead_control *ractl)
> > >                         goto skip_pages;
> > >
> > >                 index = pages[0]->index >> shift;
> > > +
> > > +               if ((pages[nr_pages - 1]->index >> shift) != index)
> > > +                       goto skip_pages;
> > > +
> > >                 bsize = read_blocklist(inode, index, &block);
> > > +               if (bsize == 0)
> > > +                       goto skip_pages;
> > > +
> > >                 res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
> > >                                          actor);
> > >
> > > -               if (res >= 0 && (pages[nr_pages - 1]->index >> shift) == index)
> > > +               if (res >= 0)
> > >                         for (i = 0; i < nr_pages; i++)
> > >                                 SetPageUptodate(pages[i]);
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > > Phillip
> > >
> > >
> > > >> This is important for the decompression code, because it
> > > >> expects each pages array entry to reference a page, which
> > > >> can be kmapped to an address.  If an entry in the pages
> > > >> array is NULL, this will break.
> > > >>
> > > >> If the pages array can have holes (NULL pointers), I have
> > > >> written an update patch which allows the decompression code
> > > >> to handle these NULL pointers.
> > > >>
> > > >> If the pages array can have NULL pointers, I can send you
> > > >> the patch which will deal with this.
> > > >
> > > > Sure, if there are better ways to deal with this.
> > > >
> > > > Thanks.
> > > >
> > > >>
> > > >> Thanks
> > > >>
> > > >> Phillip
> > > >>
> > > >>
> > > >>
> > > >>>
> > > >>>>>
> > > >>>>> It's also noticed that when the crash happened, nr_pages obtained by
> > > >>>>> readahead_count() is 512.
> > > >>>>> nr_pages = readahead_count(ractl); // this line
> > > >>>>>
> > > >>>>> 2) Normal cases that won't crash:
> > > >>>>> [   22.651750] Block @ 0xb3bbca6, compressed size 42172, src size 262144
> > > >>>>> [   22.653580] Block @ 0xb3c6162, compressed size 29815, src size 262144
> > > >>>>> [   22.656692] Block @ 0xb4a293f, compressed size 17484, src size 131072
> > > >>>>> [   22.666099] Block @ 0xb593881, compressed size 39742, src size 262144
> > > >>>>> [   22.668699] Block @ 0xb59d3bf, compressed size 37841, src size 262144
> > > >>>>> [   22.695739] Block @ 0x13698673, compressed size 65907, src size 131072
> > > >>>>> [   22.698619] Block @ 0x136a87e6, compressed size 3155, src size 131072
> > > >>>>> [   22.703400] Block @ 0xb1babe8, compressed size 99391, src size 131072
> > > >>>>> [   22.706288] Block @ 0x1514abc6, compressed size 4627, src size 131072
> > > >>>>>
> > > >>>>> nr_pages are observed to be 32, 64, 256... These won't cause a crash.
> > > >>>>> Other values (max_pages, bsize, block...) looks normal
> > > >>>>>
> > > >>>>> I'm not sure why the crash happened, but I tried to modify the mask
> > > >>>>> for a bit. After modifying the mask value to below, the crash is gone
> > > >>>>> (nr_pages are <=256).
> > > >>>>> Based on my testing on a 300K pack file, there's no performance change.
> > > >>>>>
> > > >>>>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> > > >>>>> index 20ec48cf97c5..f6d9b6f88ed9 100644
> > > >>>>> --- a/fs/squashfs/file.c
> > > >>>>> +++ b/fs/squashfs/file.c
> > > >>>>> @@ -499,8 +499,8 @@ static void squashfs_readahead(struct
> > > >>>>> readahead_control *ractl)
> > > >>>>>     {
> > > >>>>>            struct inode *inode = ractl->mapping->host;
> > > >>>>>            struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> > > >>>>> -       size_t mask = (1UL << msblk->block_log) - 1;
> > > >>>>>            size_t shift = msblk->block_log - PAGE_SHIFT;
> > > >>>>> +       size_t mask = (1UL << shift) - 1;
> > > >>>>>
> > > >>>>>
> > > >>>>> Any pointers are appreciated. Thanks!
> > > >>>>
> > > >>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
