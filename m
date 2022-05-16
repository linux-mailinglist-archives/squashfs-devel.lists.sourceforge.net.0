Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D595A52E33D
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZh-0007HD-Ko; Fri, 20 May 2022 03:45:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sxwjean@gmail.com>) id 1nqX8D-0008Ay-MY
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 09:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QG7K0C5UIXAFTSSmcVLAL1jf55VspaRHZvmzAWRmX+s=; b=lsz2dZep8jaP732Q4D3Bv/eg+b
 KlC/4jXyrw4PKIEwR3jvLqCwP13RPJgf28IHEegn0BmKndansGfipV12z1DA2DnnHgdNMn6qOvZHd
 UjcmzyazNhJlPE66rrfaLkpPgMnfuPowB5ZXd/JnyGbNQ6PlU7rrArY+Nxv1xVK0lemM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QG7K0C5UIXAFTSSmcVLAL1jf55VspaRHZvmzAWRmX+s=; b=P7k45AN1HDPDOcMWFzkiURM8uJ
 MQEJ/jWuSp62m0wtDpm1y7KPHlp2aA4oZoSVq3pigZPbj5ZDcTQlfm9Pvsr/3+236SSlmO0iqsZMU
 aavR30wKTta4VEEbbc9HDsIkgnyy7pzYNFcs0Emv3uARYJHzNYlbh9CMNiF34kjiWgtI=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqX8B-000399-O4
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 09:35:12 +0000
Received: by mail-pl1-f169.google.com with SMTP id c9so13908466plh.2
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QG7K0C5UIXAFTSSmcVLAL1jf55VspaRHZvmzAWRmX+s=;
 b=CtMVQja0o2Jd4o4G2MdKDurGCZIFKdsjKGh8jmeFfWyEl7qjsN/0oYg0Dcvcq0XXZe
 akUhIs46y5h5QnSSxpLKHYIlBiVpx2/ii+2oHG5xgk4qDmcsYgZrwfd3+VOaCALqg+25
 Lv5oCT19tpXKgdra3yFqlE1qq3+LymozY+e7zqVSw2Y+qVW4kNw0WIzeRTKjZXLURElk
 amcHeTZ1TKWu1qksQBfybaiq5r4dBH0q9NeVXE8nTPU1orDvSr0Nxk5MzJA1LOVTzBX7
 vDhcjlSFJHmhaY47pCywK97RjskO9mC/gF6vuWnJ2g4h7lxnON64eK4USz1PT/KlJx2Z
 MduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QG7K0C5UIXAFTSSmcVLAL1jf55VspaRHZvmzAWRmX+s=;
 b=2T6ClkKccPgCP60TTb/YJDHZIqLf8d0/eFZwBdhNgcLGJ42EqwNiB8Cj5vCAZeYnWa
 +/bwgiG5lzQJPcce1/5kDd6rMAC5yaP07fy/Z6+TmsSzlDm8x3IXs4YMTZETHek02UPD
 2VNSJLPLdCRGbztVhJKP/rno6iRBnNMc3yakAYUULPVnaKD5wBYgz/oC5bv8GXlOQwJc
 iJ/U/fC/67/KiUGS3Lqf7KYmM8vXv9sRym6ikNkxogL87CpQ8C+g+vY+ebnFYreWdoJa
 3xU0o+EH0gHyg1gm/DlNIVRgu0Pn8v4+pBejcpzv9A1KB85CAWcT/SAIHgj3WZSIoUL/
 5uLw==
X-Gm-Message-State: AOAM532i4ZkimpTiFE0s+IyBOrqCUwqslMiuDQUB8CVJcCgNnqu3mCOg
 k4vRQYkup5UHEDa07Z80gvpOa86ehdHeYZyB5N0=
X-Google-Smtp-Source: ABdhPJwD7ZdM5EKRwFxpqZ54vZ5TE8B+9oqb4EH2sEpUH4gc7YBM8tnzdxx1idBt4cQNdnOrNRdYybOFZhK0GMs+zEk=
X-Received: by 2002:a17:90b:4c09:b0:1dc:6c30:f230 with SMTP id
 na9-20020a17090b4c0900b001dc6c30f230mr29886065pjb.110.1652693705874; Mon, 16
 May 2022 02:35:05 -0700 (PDT)
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
 <CAJMQK-g+6j=Ty98PExxcaawU-tYP6aiA1PQ1oSmr_KSnYLfxZQ@mail.gmail.com>
In-Reply-To: <CAJMQK-g+6j=Ty98PExxcaawU-tYP6aiA1PQ1oSmr_KSnYLfxZQ@mail.gmail.com>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Mon, 16 May 2022 17:34:39 +0800
Message-ID: <CAEVVKH-d1nS=uzFNpt3MNbxMnn5qoRsu5Ztj+Y080_q5BBGPHg@mail.gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 16, 2022 at 5:10 PM Hsin-Yi Wang wrote: > > On
 Mon, May 16, 2022 at 5:00 PM Xiongwei Song wrote: > > > > You can not just
 sign your signature. You ignored others' contributions. > > Th [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sxwjean[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nqX8B-000399-O4
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

On Mon, May 16, 2022 at 5:10 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, May 16, 2022 at 5:00 PM Xiongwei Song <sxwjean@gmail.com> wrote:
> >
> > You can not just sign your signature. You ignored others' contributions.
> > This is unacceptable.
> >
>
> Hi,
>
> Don't be angry. My thought is, since this is still under review and
> I'm not sure if the performance issue is settled, it's more important
> to make sure it's ready.
>
> If it's ready, I'll send it to the list formally, so it's easier for
> maintainers (Matthew) to pick. At that time, I'll add your Tested-by
> (again, I'm not sure the performance now is okay for you or not, so I
> didn't add your tag. It would be incorrect to add your tag if the
> performance is still not desired) and Phillips's Reviewed-by (Or
> Signed-off-by) (I'm also not sure if Phillip or Matthew have other
> comments, so I can't add their signature now). Maintainers will
> probably add their Signed-off-by when they pick the patch.
>
> I'm sorry that if not adding the tags in this WIP patch now offended you.

Your apology is not sincere. I told you you should release @pages in the
exit path, you didn't even mention it. I told you patch v2 made ~6s
difference, you didn't provide any response. I told you the 9eec1d897139
("squashfs: provide backing_dev_info in order to disable read-ahead")
should be reverted, you didn't reply.  I think you don't  know what is
respection.

>
>
>
> > On Mon, May 16, 2022 at 4:23 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > On Sun, May 15, 2022 at 8:55 AM Phillip Lougher <phillip@squashfs.org.uk> wrote:
> > > >
> > > > On 13/05/2022 07:35, Hsin-Yi Wang wrote:
> > > > > On Fri, May 13, 2022 at 1:33 PM Phillip Lougher <phillip@squashfs.org.uk> wrote:
> > > > >>
> > > > >> My understanding is that this call will fully populate the
> > > > >> pages array with page references without any holes.  That
> > > > >> is none of the pages array entries will be NULL, meaning
> > > > >> there isn't a page for that entry.  In other words, if the
> > > > >> pages array has 32 pages, each of the 32 entries will
> > > > >> reference a page.
> > > > >>
> > > > > I noticed that if nr_pages < max_pages, calling read_blocklist() will
> > > > > have SQUASHFS errors,
> > > > >
> > > > > SQUASHFS error: Failed to read block 0x125ef7d: -5
> > > > > SQUASHFS error: zlib decompression failed, data probably corrupt
> > > > >
> > > > > so I did a check if nr_pages < max_pages before squashfs_read_data(),
> > > > > just skip the remaining pages and let them be handled by readpage.
> > > > >
> > > >
> > > > Yes that avoids passing the decompressor code a too small page range.
> > > > As such extending the decompressor code isn't necessary.
> > > >
> > > > Testing your patch I discovered a number of cases where
> > > > the decompressor still failed as above.
> > > >
> > > > This I traced to "sparse blocks", these are zero filled blocks, and
> > > > are indicated/stored as a block length of 0 (bsize == 0).  Skipping
> > > > this sparse block and letting it be handled by readpage fixes this
> > > > issue.
> > > >
> > > Ack. Thanks for testing this.
> > >
> > > > I also noticed a potential performance improvement.  You check for
> > > > "pages[nr_pages - 1]->index >> shift) == index" after calling
> > > > squashfs_read_data.  But this information is known before
> > > > calling squashfs_read_data and moving the check to before
> > > > squashfs_read_data saves the cost of doing a redundant block
> > > > decompression.
> > > >
> > > After applying this, The performance becomes:
> > > 2.73s
> > > 2.76s
> > > 2.73s
> > >
> > > Original:
> > > 2.76s
> > > 2.79s
> > > 2.77s
> > >
> > > (The pack file is different from my previous testing in this email thread.)
> > >
> > > > Finally I noticed that if nr_pages grows after the __readahead_batch
> > > > call, then the pages array and the page actor will be too small, and
> > > > it will cause the decompressor to fail.  Changing the allocation to
> > > > max_pages fixes this.
> > > >
> > > Ack.
> > >
> > > I've added the fixes patch and previous fixes.
> > > > I have rolled these fixes into the patch below (also attached in
> > > > case it gets garbled).
> > > >
> > > > diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> > > > index 7cd57e0d88de..14485a7af5cf 100644
> > > > --- a/fs/squashfs/file.c
> > > > +++ b/fs/squashfs/file.c
> > > > @@ -518,13 +518,11 @@ static void squashfs_readahead(struct
> > > > readahead_control *ractl)
> > > >             file_end == 0)
> > > >                 return;
> > > >
> > > > -       nr_pages = min(readahead_count(ractl), max_pages);
> > > > -
> > > > -       pages = kmalloc_array(nr_pages, sizeof(void *), GFP_KERNEL);
> > > > +       pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
> > > >         if (!pages)
> > > >                 return;
> > > >
> > > > -       actor = squashfs_page_actor_init_special(pages, nr_pages, 0);
> > > > +       actor = squashfs_page_actor_init_special(pages, max_pages, 0);
> > > >         if (!actor)
> > > >                 goto out;
> > > >
> > > > @@ -538,11 +536,18 @@ static void squashfs_readahead(struct
> > > > readahead_control *ractl)
> > > >                         goto skip_pages;
> > > >
> > > >                 index = pages[0]->index >> shift;
> > > > +
> > > > +               if ((pages[nr_pages - 1]->index >> shift) != index)
> > > > +                       goto skip_pages;
> > > > +
> > > >                 bsize = read_blocklist(inode, index, &block);
> > > > +               if (bsize == 0)
> > > > +                       goto skip_pages;
> > > > +
> > > >                 res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
> > > >                                          actor);
> > > >
> > > > -               if (res >= 0 && (pages[nr_pages - 1]->index >> shift) == index)
> > > > +               if (res >= 0)
> > > >                         for (i = 0; i < nr_pages; i++)
> > > >                                 SetPageUptodate(pages[i]);
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > > > Phillip
> > > >
> > > >
> > > > >> This is important for the decompression code, because it
> > > > >> expects each pages array entry to reference a page, which
> > > > >> can be kmapped to an address.  If an entry in the pages
> > > > >> array is NULL, this will break.
> > > > >>
> > > > >> If the pages array can have holes (NULL pointers), I have
> > > > >> written an update patch which allows the decompression code
> > > > >> to handle these NULL pointers.
> > > > >>
> > > > >> If the pages array can have NULL pointers, I can send you
> > > > >> the patch which will deal with this.
> > > > >
> > > > > Sure, if there are better ways to deal with this.
> > > > >
> > > > > Thanks.
> > > > >
> > > > >>
> > > > >> Thanks
> > > > >>
> > > > >> Phillip
> > > > >>
> > > > >>
> > > > >>
> > > > >>>
> > > > >>>>>
> > > > >>>>> It's also noticed that when the crash happened, nr_pages obtained by
> > > > >>>>> readahead_count() is 512.
> > > > >>>>> nr_pages = readahead_count(ractl); // this line
> > > > >>>>>
> > > > >>>>> 2) Normal cases that won't crash:
> > > > >>>>> [   22.651750] Block @ 0xb3bbca6, compressed size 42172, src size 262144
> > > > >>>>> [   22.653580] Block @ 0xb3c6162, compressed size 29815, src size 262144
> > > > >>>>> [   22.656692] Block @ 0xb4a293f, compressed size 17484, src size 131072
> > > > >>>>> [   22.666099] Block @ 0xb593881, compressed size 39742, src size 262144
> > > > >>>>> [   22.668699] Block @ 0xb59d3bf, compressed size 37841, src size 262144
> > > > >>>>> [   22.695739] Block @ 0x13698673, compressed size 65907, src size 131072
> > > > >>>>> [   22.698619] Block @ 0x136a87e6, compressed size 3155, src size 131072
> > > > >>>>> [   22.703400] Block @ 0xb1babe8, compressed size 99391, src size 131072
> > > > >>>>> [   22.706288] Block @ 0x1514abc6, compressed size 4627, src size 131072
> > > > >>>>>
> > > > >>>>> nr_pages are observed to be 32, 64, 256... These won't cause a crash.
> > > > >>>>> Other values (max_pages, bsize, block...) looks normal
> > > > >>>>>
> > > > >>>>> I'm not sure why the crash happened, but I tried to modify the mask
> > > > >>>>> for a bit. After modifying the mask value to below, the crash is gone
> > > > >>>>> (nr_pages are <=256).
> > > > >>>>> Based on my testing on a 300K pack file, there's no performance change.
> > > > >>>>>
> > > > >>>>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> > > > >>>>> index 20ec48cf97c5..f6d9b6f88ed9 100644
> > > > >>>>> --- a/fs/squashfs/file.c
> > > > >>>>> +++ b/fs/squashfs/file.c
> > > > >>>>> @@ -499,8 +499,8 @@ static void squashfs_readahead(struct
> > > > >>>>> readahead_control *ractl)
> > > > >>>>>     {
> > > > >>>>>            struct inode *inode = ractl->mapping->host;
> > > > >>>>>            struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> > > > >>>>> -       size_t mask = (1UL << msblk->block_log) - 1;
> > > > >>>>>            size_t shift = msblk->block_log - PAGE_SHIFT;
> > > > >>>>> +       size_t mask = (1UL << shift) - 1;
> > > > >>>>>
> > > > >>>>>
> > > > >>>>> Any pointers are appreciated. Thanks!
> > > > >>>>
> > > > >>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
